From: Nicolae Mihalache <mache@abcpages.com>
Subject: Re: corrupted files
Date: Sun, 10 Apr 2005 20:50:01 +0200
Message-ID: <42597559.1070203@abcpages.com>
References: <425704EA.7020707@abcpages.com> <4257D20B.3030302@gmx.net> <4258194B.6090708@abcpages.com> <425829F9.3020606@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23834-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <425829F9.3020606@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Linuxhippy wrote:
> Hi!
> 
>> Otherwise I inted to reformat completely that partition (should I 
>> still use reiserfs3? somehow I don't trust it anymore).
> 
> 
> I also had serveral problems with corrupted files - until I opend my 
> laptop and cleaned/sealed the conductors of my harddrive - till now it 
> works great!
> 
> ReiserFS is used on so many computers, even highest availability 
> systems, I think your bug is either hardware or controller-driver based...
> 
> lg Clemens
> 

Ah, I just run now a "badblocks -s -v -c 100000 -n -t random /dev/hdc8" 
which reads/writes big chunks of data on the partition and it returns 
plenty of bad blocks. When run with default args (ie few KB of data at a 
time), "badblocks" returns no error.
So it has nothing to do with reiserfs but rather with crappy hardware.

Sorry for bothering you and thanks for the good work you do with reiserfs!

mache
