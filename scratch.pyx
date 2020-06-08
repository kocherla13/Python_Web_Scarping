import requests
import pprint as p
from bs4 import BeautifulSoup
URL='https://www.monster.com/jobs/search/?q=ETL-Developer&where=Texas'
page=requests.get(URL)
page.encoding='utf-8'
soup = BeautifulSoup(page.content,'html.parser')
results=soup.find(id='ResultsScrollable')
python_InJob=results.find('h2',string=lambda text: 'python' in text.lower() )
print(python_InJob.text)
job_elements=results.find_all('section',class_='card-content')
for job_element in job_elements:
    title_element=job_element.find('h2',class_='title')
    if (title_element) is not None:
        print (title_element.a.text.strip())
    company_element=job_element.find('div',class_='company')
    if (company_element) is not None:
        print(company_element.find('span',class_='name').text)
    location_element=job_element.find('div',class_='location')
    if (location_element) is not None:
        print(location_element.find('span',class_='name').text)
    posted_on_element=job_element.find('div',class_='meta flex-col')
    if (posted_on_element) is not None:
        print(posted_on_element.find('time').text)
    print()