From: Yury Umanets <umka@namesys.com>
Subject: Re: "Unformat" a ReiserFS partition : a testimony :-)
Date: Tue, 25 Mar 2003 03:16:17 +0300
Message-ID: <3E7F9FD1.7060801@namesys.com>
References: <3E7F5E33.4020709@info.ucl.ac.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13360-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E7F5E33.4020709@info.ucl.ac.be>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nicolas Vanderavero <nv@info.ucl.ac.be>
Cc: reiserfs-list@namesys.com

Nicolas Vanderavero wrote:

> Hello,

Hello Nicolas,

>
>
> while reinstalling a Debian on a new hard drive, I made the mistake to 
> format in reiserfs my good old /home which was on /dev/sda7 instead of 
> formatting the new /dev/hda7. Gasp ! Eight gigabytes lost ...
>
> Or ... maybe it was not totally lost :-) I immediately made a dump of 
> the partition with 'dd' and started grepping some known text on it. It 
> seemed that no data was really lost. I didn't know what to do. So I 
> read the man pages and found the reiserfsck command quite interesting :-)


You have lost the super block and probably old root node. I said 
"probably" because it might be not used in teh time you did format.

>
>
> Ok, I am a total newbie to filesystems and to ReiserFS. So maybe it 
> will sound trivial to you, but just in case it happens to anyone else, 
> I just wanted to say that running a reiserfsck --rebuild-tree -S on my 
> partition was enough to unformat it. I ended up with some file in 
> lost+found, but a 'file *' is enough to discover what they are. 

The first thing you should do in cases like this is to make backup. I 
hope you'll find eight gigabytes for that. Now you may feel free to do 
anything with you old partition. Then you should to do --rebuild-sb and 
try to fsck the partition with --check key. Then follow to fsck sugestions.

These should be enought for getting you partition back.

>
>
> So, maybe it would be usefull to add an entry in the "Example of 
> using" section of the man page of reiserfsck, saying something like : 
> "If you reformatted by mistake a reiserFS partition, you can try to 
> unformat it by running reiserfsck --rebuild-tree -S on it". 

Sounds good. Probably Vitaly should consider about that for including it 
in the next fsck -pre.

>
>
> Anyway, thank you for developing this filesystem.
> Nicolas Vanderavero.
>
>
>
>
>
>

P.S. Please read http://www.namesys.com/support.html. Can you as for 
support?

-- 
Yury Umanets


