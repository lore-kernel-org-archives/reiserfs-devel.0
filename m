From: Cookie-Monster <cookie.monster@starfall.de>
Subject: Re[2]: Problem with my HDD
Date: Thu, 30 May 2002 13:35:52 +0200
Message-ID: <261301681.20020530133552@starfall.de>
References: <10512850437.20020529194929@starfall.de>
 <Pine.LNX.4.44.0205300905050.22928-100000@avon.timetraveller.org>
 <20020530091410.B3922@namesys.com>
Reply-To: Cookie-Monster <cookie.monster@starfall.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10451-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020530091410.B3922@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

>> If you can I'd consider getting an image of the drive.  It may help with
>> data recovery later.  something like:
>> dd if=/dev/sda1 of=/bigfilesystem/diskimage

> That does not work on bad hard drives, resulting image would be almost useless.
> BTW, this way it stops on first read error.

If it stops at the first read error, can I put this image back onto
the formatted disk, so I have left the working blocks?



--
Cookie-Monster
cookie.monster@starfall.de
http://www.starfall.de/

