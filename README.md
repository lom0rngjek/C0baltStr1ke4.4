# ខូបលស្ត្រែគ៤.៤

<p align="center">
    <img src="https://github.com/lom0rngjek/C0baltStr1ke4.4/blob/main/images/cbs4.4.png" alt="Image"  />
</p>

ខូបលស្ត្រែគ៤.៤ - ឧបករណ៍ post exploitation ប្រើពាក្យបញ្ជានិងគ្រប់គ្រងពីចំងាយ។

## របៀបតម្លើង
១, ទាញយកផ្ទាល់ ឬ ក្លូនដាក់នៅលើម៉ាស៊ីនមេ

២, ពន្លាឯកសារឈ្មោះ cobaltstrike.zip ចេញមកក្រៅ

៣, បើក Terminal រួចវាយពាក្យបញ្ជា៖
~~~console
l0j@kali:~$ chmod +x teamserver start.sh
l0j@kali:~$ sudo ./teamserver "ip_address" "password" ["malleableC2profile" "kill_date"]
~~~
* ip_address (ត្រូវតែដាក់) - ដាក់លេខអាយភីខាងក្រៅដែលអាចទាក់ទងគ្នាបានរវាងម៉ាស៊ីនមេនិងកូន។
* password (ត្រូវតែដាក់) - លេខសំងាត់ប្រើដើម្បីការពារកំឡុងពេលចូលក្នុងប្រព័ន្ធ។
* malleableC2profile (មិនដាក់បាន) - កំណត់ឈ្មោះជាក់លាក់របស់ Malleable C2 Profile ដែលមានរួច។
* kill_date (មិនដាក់បាន) - កំណត់តម្លៃថ្ងៃខែជាទម្រង់ YYYY-MM-DD ដើម្បីឲ្យ teamserver ធ្វើការបង្កប់នៅថ្ងៃខែសម្លាប់នេះនៅគ្រប់ beacons ដែលបានបង្កើតរួច។ Beacon និងមិនដំណើរការទេប្រសិនបើវាត្រូវបានបើកនៅកំឡុងពេល ឬនៅក្រោយពេលដែលជួបនិងថ្ងៃខែសម្លាប់។

៤, បើក Terminal មួយទៀតហើយវាយពាក្យបញ្ជា៖
~~~console
l0j@kali:~$ sudo ./start.sh
~~~
៥, បញ្ជូលលេខអាយភី ឈ្មោះ និង លេខសំងាត់ បន្ទាប់មកចុចភ្ជាប់ជាការស្រេច។

<p align="center">
    <img src="https://github.com/lom0rngjek/C0baltStr1ke4.4/blob/main/images/cbs-teamserver-connect.png" alt="Image"  />
</p>

ផ្ទៀងផ្ទាត់លេខហាស់នៃឯកសារ [Cobalt Strike 4.4](https://verify.cobaltstrike.com)

## បញ្ហាដែលនឹងកើតមាន
ខ្ញុំបានតម្លើងវាដាក់នៅលើម៉ាស៊ីនកាលី (kali linux 2021.4) ហើយបានជួបនូវបញ្ហាជាមួយនិងជំនាន់របស់ Java ដែលបានតម្លើងមកស្រាប់ក្នុងម៉ាស៊ីន។

<p align="center">
    <img src="https://github.com/lom0rngjek/C0baltStr1ke4.4/blob/main/images/java-error.jpg" alt="Image"  />
</p>

ដើម្បីដោះស្រាយគឺតម្រូវឲ្យខ្ញុំប្ដូរជំនាន់ Java ទៅជំនាន់ខ្ពស់ជាងមុន ១៧+ ដែលជំនាន់ចាស់គឺ ១១។

## របៀបប្ដូរជំនាន់ Java

ដំបូងយើងត្រូវទាញយក Java ពីវែបសាយដើមរបស់វាជាមុនសិនដោយប្រើដំណមួយនេះ [openjdk17](https://download.java.net/java/GA/jdk17.0.1/2a2082e5a09d4267845be086888add4f/12/GPL/openjdk-17.0.1_linux-x64_bin.tar.gz) ឬទាញយកដូចវិធីខាងក្រោម៖

~~~console 
curl -O https://download.java.net/java/GA/jdk17.0.1/2a2082e5a09d4267845be086888add4f/12/GPL/openjdk-17.0.1_linux-x64_bin.tar.gz
~~~

ពន្លាឯកសារ JDK

~~~console 
tar xvf openjdk-17.0.1_linux-x64_bin.tar.gz
~~~
ប្ដូទីតាំងឯកសារទៅកាន់ថតឯកសារ /opt/

~~~console 
sudo mv jdk-14 /opt/
~~~

តម្លើង Java Environment

~~~console 
sudo tee /etc/profile.d/jdk17.sh <<EOF
export JAVA_HOME=/opt/jdk-17
export PATH=$JAVA_HOME/bin:$PATH
EOF
~~~

Source ឯកសារ Profile

~~~console
source /etc/profile.d/jdk14.sh
~~~

បញ្ជាក់ជំនាន់ Java

~~~console
l0j@kali:~$ echo $JAVA_HOME
/opt/jdk-17

l0j@kali:~$ java -version
Picked up _JAVA_OPTIONS: -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true
openjdk version "17" 20xx-xx-xx
OpenJDK Runtime Environment (build 17+35-2724)
OpenJDK 64-Bit Server VM (build 17+35-2724, mixed mode, sharing)
~~~

## ឯកសារយោង
* https://raidforums.com/Thread-Cobalt-Strike-4-4-w-kits-5-working-download-locations
* https://computingforgeeks.com/how-to-install-java-14-on-ubuntu-debian
