From: Hans Reiser <reiser@namesys.com>
Subject: Re: NFS setup for a reiserfs-based /home
Date: Thu, 26 Sep 2002 00:37:43 +0400
Message-ID: <3D921E97.3050107@namesys.com>
References: <20020924215756.GA24963@jerry.marcet.dyndns.org> <20020925114009.B23339@namesys.com> <200209251533.19567.Dieter.Nuetzel@hamburg.de> <20020925173718.A17138@namesys.com> <20020925154626.S32363@noris.de> <20020925175128.A3477@namesys.com> <20020925160957.U32363@noris.de> <3D91FFA5.9010909@namesys.com> <3D920F90.7060206@edsons.demon.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11542-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>
Cc: =?ISO-8859-1?Q?Philippe_Gramoull=E9?= <philippe.gramoulle@mmania.com>

Somebody wrote:

>> Hans,
>>
>> which HW RAID controllers would you advice?
>>
>> Cheers,
>>
>  
>
Unfortunately I just don't know.  We can't afford them at Namesys.....;-)

I am going to test some of Philippe's RAID equipment for Reiser4 (his 
company sponsors Reiser4 with a very substantial service contract), I 
should probably add the following test.

Try putting putting some data into the FS that is small enough to fit 
into the RAID card NVRAM, letting it go idle for an hour, yanking the 
power cord out, and then putting another RAID card which is the same 
brand card in as a replacement for your card while the machine is off, 
rebooting, and seeing what happens to your data.  If I understand 
properly from a few users, there exist some cards/RAID units for which 
the data will be non-existent on the disks.  I would not use such cards 
myself.  

I think it would be useful if the identity of such cards became known. 
 Notice how I avoid saying any names because I want to see it reproduced 
independently first before I say any names.  These users I know about 
found out by equipment failing, and one should always be careful about 
reproducing the cause for such events before repeating the story to others.

RAID controllers going kaput are not any rarer than any other PC cards 
going kaput, so....  You probably all know people who didn't backup a 
RAID device, and the controller scribbled garbage to disk, and the 
source code repository or other mission critical datastore.....

Hans







