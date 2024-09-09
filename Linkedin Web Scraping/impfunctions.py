#Importing the necessary modules
from random import random
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome import options
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import pandas as pd        
import time
import datetime
from datetime import date,timedelta
import json
from bs4 import BeautifulSoup
import requests

# Function to do infinite scroll
def infinite_scroll(wd1):
    last_height = wd1.execute_script("return document.body.scrollHeight")
    while True:
        # Scroll down to the bottom
        wd1.execute_script("window.scrollTo(0, document.body.scrollHeight);")
        
        # Wait for new content to load
        time.sleep(3)  # Adjust this time as needed
        
        # Calculate new scroll height and compare with last scroll height
        new_height = wd1.execute_script("return document.body.scrollHeight")
        page_source=wd1.page_source
        soup = BeautifulSoup(page_source)
        textval=soup.find('button',{'aria-label':'See more jobs'}).text.strip()
        if new_height == last_height and textval=='See more jobs':
            last_height=new_height
            wd1.execute_script("window.scrollBy(0, -500);")
            time.sleep(5)
            wd1.execute_script("window.scrollBy(0, 500);")
            new_height = wd1.execute_script("return document.body.scrollHeight")
            if new_height == last_height:
                break  # Break the loop if no more new content is loaded
        
        last_height = new_height
    return last_height

# Function to click see more jobs
def find_and_click_see_more_jobs(last_height,wd1):
    last_height = last_height
    try:
        time.sleep(5)
        see_more_button = WebDriverWait(wd1, 10).until(
            EC.presence_of_element_located((By.XPATH, '//button[@aria-label="See more jobs"]'))
        )
        see_more_button.click()
        time.sleep(5)
        new_height = infinite_scroll(wd1)
        if new_height == last_height:
            atempts=0
            while new_height == last_height and atempts<=3:
                last_height=new_height
                see_more_button.click()
                new_height = infinite_scroll(wd1)
                if new_height == last_height:
                    atempts+=1
                    statusval= False
                elif atempts>3:
                    break
                else:
                    atempts=0
                    new_height = infinite_scroll(wd1)
                    statusval=True
                print(statusval)
        else:
            new_height = infinite_scroll(wd1)
            statusval=True
        return statusval
    except:
        return False

def scrapping_link(link,wd1):
    wd1.get(link)
    time.sleep(5)
    while True:
        last_height=infinite_scroll(wd1)
        if not find_and_click_see_more_jobs(last_height,wd1):
            break


def getting_url(job,loc):
    job1=job.replace(' ','%20')
    loc1=loc.replace(' ','%20')
    url='https://www.linkedin.com/jobs/search?keywords={}&location={}&f_JT=F&f_TPR=r86400&position=1&pageNum=0'.format(job1,loc1)
    return url