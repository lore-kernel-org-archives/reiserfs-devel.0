From: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Subject: reiser4: fd -1 problem ?
Date: Wed, 07 Dec 2005 01:04:13 +0100
Message-ID: <439626FD.7020500@ursynow.2a.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27209-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello, i've been investigating this problem for few weeks, and it seems 
reiser4 can be reason for this.

My apache process is from no clear reason suddenly peaking to 95% CPU 
usage and it stays that way until i kill it and start again.

It happens 6-7 times a day, i have hosting services on my server. I 
thought it was apache fault, but it strings shows this:

[pid 31610] munmap(0xb6f29000, 729088)  = 0
[pid 31610] mmap2(NULL, 729088, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6f29000
[pid 31610] munmap(0xb6f29000, 729088)  = 0
[pid 31610] mmap2(NULL, 729088, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6f29000


in endless loop, when this strange 'lock' happens.

is it a problem of fd -1 ? of course that could be also apache bug, that 
it can't handle wrong fd number, but why there is wrong fd number?

i ran reiser4.fsck and it didnt help.

i use kernel 2.6.12.6 with latest 2.6.12 reiser4 patch, as it seemed the 
most stable from recent releases.

What could be the problem here, and how can i repair it ? should i keep 
running fsck.reiser4 until it finds it ?

it doesnt happen very often, but like i said 6-7 times a day, but it 
varies, sometimes it more often sometimes almost 0.

thanks in advance for response. (this is probably not Apache issue, i 
already asked for this many many times)

