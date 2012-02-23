From: =?iso-8859-2?Q?Marek_Kr=F3likowski?= <admin@wset.edu.pl>
Subject: Problem with reiserfs after upgrade to kernel 2.6.33+ ( include 3.2.X )
Date: Thu, 23 Feb 2012 19:29:49 +0100
Message-ID: <2F4B2E154D3F48CD86E27BE6E38D4BEE@SERWER>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: reiserfs-devel@vger.kernel.org

Hello Guys
I don`t know this is the best place but i got amazing problem with reiserfs.
After 5 years working without problem on 2.4.X and 2.6.32 i change kernel to 
3.X and my all machine with reiserfs get frozen when is many IO.
I check and i backroll kernel to 2.6.32 and machine working stable for 
week...
So i again change 2.6.32 to stable 2.6.33.20 and again my all servers with 
resierfs frozen...
there is complete nothing in dmesg/logs/screen - only i see when i use TOP 
server got iowait to 100% and load going up up up and machine frozen...
I check everything with system and on 3 other machine IBM/HP and exacly this 
same effect... looks like something was change in kernel 2.6.33 and machine 
with many IO with resierfs get frozen...
After  this i check the latest stable 3.2.2 kernel... and this same effect - 
no information in dmesg/logs .... just iowait going up up up and machine 
frozen...
Anyone know what is wrong?
Ofc i check kernel 2.6.32.57 and working good - no frozen from last 7 
days...

Thanks for answer.
Marek 

