From: Yury Umanets <umka@namesys.com>
Subject: Re: New Reiser4 snapshot?
Date: Tue, 15 Jul 2003 09:28:27 +0400
Message-ID: <3F1390FB.6050506@namesys.com>
References: <08628CA53C6CBA4ABAFB9E808A5214CB0179043E@mercury.infiniconsys.com> <1058210604.3694.4.camel@pilot.stavtrup-st.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14938-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1058210604.3694.4.camel@pilot.stavtrup-st.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Nielsen <Lovechild@foolclan.com>
Cc: reiserfs <reiserfs-list@namesys.com>

David Nielsen wrote:

>New to the list, so I'm sorry if this has been asked previously
>
>With the arrivial of 2.6.0-test1 can we expect a snapshot of Reiser4
>anytime soon for those of us who likes to break our boxes ?
>
We are considering about making some.

>
>I know this is a long shot, but have ReiserFS3 on a EVMS2 based RAID0
>(RAID1 for /boot)  and I would really hate to have to reinstall my
>entire system - is there an easy way to convert my current FS to Reiser4
>or is using a tool like Mondo or tar the only way ? 
>
You probably need in-place convertation. Yes, there is one way. You need 
to do something like this:

(1) Build-in reiser4 into you kernel.
(2) Create file, that consists of holes on you reiser3 partition by 
means of using dd command. Say reiser4.img. It should have size that is 
enough for you data on /boot

(3) Create reiser4 in reiser4.img. Use reiser4progs from our ftp.
(4) Mount reiser4 to somewhere, say, /mnt/reiser4
(5) Copy all files from /boot to /mnt/reiser4
(6) When copy is finished, you have reiser3 partition with one big file 
on it and all you need to do is to remap /boot/reiser4.img to device, 
/boot lies on. I mean, say reiser4.img file starts from 345 block and 
has 3456 contiguous blocks next to 345. You need to move blocks starting 
from 345 to block 0 on your device.

Actually it may be done by some program, which uses FIBMAP ioctl for 
getting block numbers and move them to new location. Bu we have not such 
a program. May be convertfs will help you. google it :)

>
>Regards 
>David Nielsen
>
>
>
>  
>


-- 
Yury Umanets
"We're flying high, we're watching the world passes by..."



