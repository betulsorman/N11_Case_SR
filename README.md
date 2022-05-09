<h1>Test Case N11 Web App Otomasyon Projesi</h1>
Bu proje n11 web uygulaması otomasyonunu içermektedir. 
<h2>Tool stack</h2>

* Ruby
* Selenium
* Capybara
* Cucumber
* RSpec
* RubyMine

<h3>Kurulum</h3>
* Ruby kurulumu yapılmış olmalıdır. <a href="https://www.ruby-lang.org/en/downloads/">Link to install</a>

* Browserlara ait driverlar indirilmiş olmalıdır. <a href="https://chromedriver.chromium.org/downloads">chromedriver</a> <a href="https://github.com/mozilla/geckodriver/releases">firefox driver</a>

* İndirilen driverlar bir klasöre atılmalı ve bu klasör environment variable a eklenmelidir. Örn: C:\bin <a href="https://www.architectryan.com/2018/03/17/add-to-the-path-on-windows-10/">örnek variable ekleme</a>

* Proje locale clonlanır.

* Gerekli kütüphanelerin yüklenilebilmesi için, proje dizininde ```bundle install``` command i çalıştırılır.

* Tüm kütüphaneleri indirdikten sonra ``cucumber`` komutuyla proje çalıştırılır.

<h3>Proje yapısı</h3>

<h3>Folder Açıklamaları</h3>

<h4>Config</h4>
Burada projeye ait konfigürasyonlar tutulacaktır.

<h4>Pages</h4>
Burası projedeki Page Object Model implementasyonu için kullanılacaktır.


<h4>Step_Definitions</h4>
Senaryolara ait step tanımlamalarının yapıldığı yer bu klasör olacaktır.


<h4>Support</h4>
Hooks ve gerekli diğer env tanımlamalarının yapıldığı yer bu klasör olacaktır.


<h4>Tests</h4>
Feature filelar yani BDD formatındaki test caseler bu klasör altında yer alacaktır.


<h4>Utils</h4>
Projeye ait utils class ve metodlar bu klasör içerisinde tanımlanacaktır.


<h4>Gemfile</h4>
Projenin gerekli kütüphanelerinin yüklenilmesi için gerekli olan file.


<h2>İsimlendirme Kuralları</h2>
Proje genelinde pascal_case yazım şekli takip edilecektir. İsimlendirmeler yapılırken aşağıdaki durumlar takip edilecektir.

``variable name = my_variable``

``method name = my_method``

``class name = MyClass``

``file name = my_file.rb``

``element name = @my_element_id @my_element_css @my_element_xpath``

``Feature name = my_feature``

``folder name = my_folder``

``tag name = @my_tag``


<h2>Senaryo Yazımı</h2>

* Senaryolar feature file içerisine yazılacaktır.
* Given, When, Then, And Gherkin Syntax'i kullanılacaktır.
* Feature file başlangıcında Feature keywordunden sonra ilgili feature ın isimlendirmesi yapılacaktır. Feature name unique olmalıdır.
* Senaryolar Scenario keywordunden sonra yazılacaktır. Senaryo name unique olmalıdır.
* Her senaryo taglenmelidir. İlgili tagler senaryonun üst kısmına koyulmalıdır. @regression, @smoke gibi.
* Senaryo stepleri yazılırken aşağıdaki örnek senaryo kalıpları kullanılmalıdır.



<h3>Gherkin Nedir</h3>

Gherkin, Cucumber ile test durumları yazarken kullanılan gramer yapısının genel adıdır. Gayet basit ve anlaması kolay olan bu yapıda kurulan cümleler günlük konuşma dilindeki cümlelere oldukça yakın olduğu için test durumlarını yazarken adeta yazılımla konuşuyormuş hissiyatı oluşturur.

Gherkin dili belirli anahtar kelimelerden faydalanır.

Bir testi ve senaryoları isimlendirmek için kullanılan anahtar kelimeler aşağıdaki gibidir:

```
Feature : Testi Yapılacak Özelliğin Adı
Scenario : Uygulanacak Senaryo Adı
Scenario Outline: Aynı senaryoyu birden fazla durum için çalıştırmak gerektiğinde taslak senaryo oluşturmak için kullanılır.
Tanımlanan senaryoda uygulanacak işlem adımlarını tanımlamak için de aşağıdaki anahtar kelimeler kullanılır. Bu işlemlerin her birine “Step” yani adım adı verilir.

Given: Sistemin başlangıç durumunu tanımlar. Sistemin tanımlanmış bir duruma geçmesini sağlar.
When: Bir olay yada aksiyonu tanımlamak için kullanılır. Yapılmak istenen bir eylem bu anahtar kelimeden sonra yazılır.
Then: Beklenen bir sonucu yada durumu tanımlamak için kullanılır. Beklenen durumla gerçekleşen durumu karşılaştırdığımız ifade bu anahtar kelimeden sonra yazılır.
And, But: Yukarıda bahsedilen Given ,When ve Then ifadelerinden birden fazla ardarda yazılmak istendiğinde bu anahtar kelimeler kullanılır.
```


<h4>Örnek</h4>
```
Given open homepage
And clicks login button
And fill valid credentials
When clicks on login button
Then user should see my account icon
```


<h3>Kullanılabilecek Örnek Senaryo Kalıpları</h3>
```
open homepage
clicks on [button/page/something]
select [area/package/something]
login with email for [package_type]
login with [user] and [password]
go to [page/content/something]
create [member_type] email user on Register page
fill user information
play with web service on [Client]
verify [message/situations]
check [message/page/package]
user should see  [message/page/button/something]
```

<h3>Tag Yönetimi</h3>

```
@TODO = Developmentı henüz tamamlanmamış senaryo / feature

@smoke = Smoke kapsamında çalışması beklenen senaryo / feature

@excluded  = Uygulama üzerinde artık var olmayan ancak senaryosu geliştirilmiş senaryo / feature

@bugId = Uygulama üzerinde var olan bir bugdan dolayı bug fix bekleyen senaryo / feature
Aşağıdaki örnek gibi bug_id tagı ile birlikte kullanılmalıdır.
Örnek Kullanım : @QAD-1234

@prod  = Prodda koşacak senaryolar

@regression  = Regresyon sırasında koşması gereken caseler

NOT :

1- @smoke ve @prod taglerı alan senaryolar : 
    @prod tagı olanlar prod ortamında koşabilir , 
    @smoke tagı olan senaryolar ise regresyon ve test ortamında smoke case olarak koşabilir

2- @regression tagı olan caseler ise sadece regresyon ve test ortamında kosabılecek caselerdır.
```

