From: "Flora Dru" <dru@dicts.mak.ac.ug>
Subject: Re: Filesystem repair and Data Recovery
Date: Fri, 01 Jul 2005 18:32:54 +0300
Message-ID: <20050701153254.F285AA07E@mail.mak.ac.ug>
References: <20050701112954.B2F849FF0@mail.mak.ac.ug>
            <1120220361.3603.62.camel@tribesman.namesys.com>
            <20050701130616.2D2FCA04E@mail.mak.ac.ug>
            <1120226737.3603.85.camel@tribesman.namesys.com>
            <20050701143553.57D5BA02C@mail.mak.ac.ug>
            <1120230853.3603.97.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24899-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1120230853.3603.97.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com


>> 
> ls -l /mnt?

rwx------  109 popmail  popmail      4096 Jun 16 11:27 finance.mak.ac.ug
drwx------  405 popmail  popmail      8192 May 16 11:21 forest.mak.ac.ug
?---rwS-wx  14132 1431505464 1245851954 1163544915 Jul 29  2002 
hospital.mak.ac.ug
drwx------  121 popmail  popmail      4096 Jun 15 10:39 iace.mak.ac.ug
drwxr-xr-x  426 popmail  popmail      8192 Jun 18 16:33 ics.mak.ac.ug
?r-xr-Srw-  8308 544433262 1918984552 543649385 Aug 21  2021 iph.mak.ac.ug
drwx------  438 popmail  popmail      8192 May 17 10:23 isae.mak.ac.ug
drwx------   56 popmail  popmail      4096 Jun 16 10:41 law.mak.ac.ug
drwx------    2 root     root         4096 May 29 22:02 lost+found
br-srw-r--  17418 925986415 959925040  54,  54 Jan  1  2018 mak.ac.ug
drwx------   24 popmail  popmail      4096 Nov 25  2004 makdos.mak.ac.ug
drwx------  160 popmail  popmail      4096 Jun 27 14:54 masscom.mak.ac.ug
drwx------   69 popmail  popmail      4096 Jun 23 11:30 math.mak.ac.ug
drwx------  1463 popmail  popmail     28672 Jun 24 16:43 med.mak.ac.ug
?r-xrw---t  12109 1499101751 811806537 1868974179 Nov 30  2032 
misr.mak.ac.ug
drwx------    6 popmail  popmail      4096 Apr 28 10:39 mubs.mak.ac.ug
drwx------   21 popmail  popmail      4096 Jun 24 09:50 mugs.mak.ac.ug
drwx------   63 popmail  popmail      4096 Oct 15  2004 muie.mak.ac.ug
drwx------   85 popmail  popmail      4096 May 30 11:28 muienr.mak.ac.ug
drwx------    7 popmail  popmail      4096 May 19  2004 muip.mak.ac.ug
drwxr-xr-x    3 popmail  popmail      4096 Apr  8 09:49 muklaw.ac.ug
drwx------  219 popmail  popmail      4096 Jun 16 14:00 mulib.mak.ac.ug
drwx------   15 popmail  popmail      4096 May 19  2004 muspgs.mak.ac.ug
drwx------   16 popmail  popmail      4096 May 19  2004 pdd.mak.ac.ug
drwx------   31 popmail  popmail      4096 Nov 23  2004 physics.mak.ac.ug
drwx------    3 popmail  popmail      4096 May 19  2004 printery.mak.ac.ug
drwx------   26 popmail  popmail      4096 Jun 17 14:29 projects.mak.ac.ug
?--xr-Sr--  25674 1714972282 1114916184 961691984 Dec  1  2033 sci.mak.ac.ug
drwx------   54 popmail  popmail      4096 Feb  1 09:11 sifa.mak.ac.ug
drwxr-xr-x  776 popmail  popmail     16384 Jun 12 14:09 ss.mak.ac.ug
drwxr-xr-x    7 popmail  popmail      4096 May 30 08:35 tech.mak.ac.ug
drwx------  500 popmail  popmail     12288 May 30 16:16 vetmed.mak.ac.ug
drwx------   54 popmail  popmail      4096 May  2 15:13 zoology.mak.ac.ug 

 

> Can you umount /dev/sdc1 or remount readonly?
umount and mount as readwrite are successful but mount readonly returns
mount: /dev/sdc1 already mounted or /mnt busy 

>> 
>> thanks again  
>> 
>>  
>> 
> 
 

