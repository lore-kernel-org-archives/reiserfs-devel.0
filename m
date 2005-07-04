From: "Flora Dru" <dru@dicts.mak.ac.ug>
Subject: Re: Filesystem repair and Data Recovery
Date: Mon, 04 Jul 2005 13:50:28 +0300
Message-ID: <20050704105028.A4D9DA2AA@mail.mak.ac.ug>
References: <20050701112954.B2F849FF0@mail.mak.ac.ug>
            <1120220361.3603.62.camel@tribesman.namesys.com>
            <20050701130616.2D2FCA04E@mail.mak.ac.ug>
            <1120226737.3603.85.camel@tribesman.namesys.com>
            <20050701143553.57D5BA02C@mail.mak.ac.ug>
            <1120230853.3603.97.camel@tribesman.namesys.com>
            <20050701153254.F285AA07E@mail.mak.ac.ug>
            <1120234546.3603.111.camel@tribesman.namesys.com>
            <20050701163625.1C533A069@mail.mak.ac.ug>
            <1120239440.10316.119.camel@tribesman.namesys.com>
            <20050702101916.31F449FEA@mail.mak.ac.ug>
            <1120395556.4219.13.camel@tribesman.namesys.com>
            <20050703143512.C778CA0F5@mail.mak.ac.ug>
            <1120471614.5803.40.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24941-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1120471614.5803.40.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Hi 

~67gb? You said earlier about 27gb.
What does 'fdisk -l /dev/sdc' say? 

 

The hard disk is 68gb but amount of data is 27gb 

fdisk -l /dev/sdc 

Disk /dev/sdc: 255 heads, 63 sectors, 8855 cylinders
Units = cylinders of 16065 * 512 bytes 

Device Boot    Start       End    Blocks   Id  System
/dev/sdc1             1      8855  71127756   83  Linux 

Am I correct that there were no lines like 'block 34640 is reiserfs
leaf'? 


Yes you are correct. 

regards
Florence 


