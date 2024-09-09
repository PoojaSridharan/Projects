# Importing necessary modules
from impfunctions import *

# Main function
def main(wd1,jobtitle,joblocation):
    url=getting_url(jobtitle,joblocation)
    wd1.get(url)
    time.sleep(5)
    scrapping_link(url,wd1)
    page_source=wd1.page_source
    soup = BeautifulSoup(page_source)
    joblist=soup.find('ul','jobs-search__results-list').find_all('li')
    links=[]
    for i in joblist:
        joblinks=i.find('a').get('href')
        links.append(joblinks)

    titlename=[]
    companyname=[]
    areaname=[]
    postedtime=[]
    numofapp=[]
    positioninformation=[]

    for l in links:
        url1=requests.get(l)
        soup1=BeautifulSoup(url1.content)
        datas=soup1.find('div','top-card-layout__entity-info flex-grow flex-shrink-0 basis-0 babybear:flex-none babybear:w-full babybear:flex-none babybear:w-full')
        try:
            title=datas.find('h1').text
        except:
            title=''
        titlename.append(title)
        try:
            company=datas.find('h4').find('span','topcard__flavor').text.strip()
        except:
            company=''
        companyname.append(company)
        try:
            area=datas.find('h4').find('span','topcard__flavor topcard__flavor--bullet').text.strip()
        except:
            area=''
        areaname.append(area)
        try:
            applicants=datas.find('h4').find('span','num-applicants__caption topcard__flavor--metadata topcard__flavor--bullet').text.strip()
        except:
            applicants = ''
        numofapp.append(applicants)
        try:
            postedon=datas.find('h4').find('span','posted-time-ago__text posted-time-ago__text--new topcard__flavor--metadata').text.strip()
        except:
            postedon=''
        postedtime.append(postedon)
        try:
            position_type=soup1.find('ul','description__job-criteria-list').find_all('li')
            positionkey=[]
            positionval=[]
            for j in position_type:
                positionkey.append(j.find('h3','description__job-criteria-subheader').text.strip())
                positionval.append(j.find('span','description__job-criteria-text description__job-criteria-text--criteria').text.strip())
            positioninfo=dict(zip(positionkey,positionval))
        except:
            positioninfo=''
        positioninformation.append(positioninfo)
    df=pd.DataFrame()
    df['Title']=titlename
    df['Keyword Used']=jobtitle
    df['Company']=companyname
    df['Area']=areaname
    df['Country']=joblocation
    df['Posted On']=postedtime
    df['Number of Applicants']=numofapp
    df['Position Information']=positioninformation
    normalized_df = pd.json_normalize(df['Position Information'])
    df = df.drop(columns=['Position Information']).join(normalized_df)
    df=df.dropna()
    return df