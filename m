From: Domenico Andreoli <cavok@debian.org>
Subject: Re: Bug#233219: reiserfsprogs: fsck fails with "filesystem mounted rw" while filesystem is actually mounted ro
Date: Tue, 17 Feb 2004 20:10:06 +0100
Sender: Domenico Andreoli <cavok@tiscali.it>
Message-ID: <20040217191006.GA1384@raptus>
References: <20040217122723.18F83C2A4@Students.CS.UniBO.It>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16821-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040217122723.18F83C2A4@Students.CS.UniBO.It>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ciro Mattia Gonano <gonano@CS.UniBO.It>, "Adam C. Emerson" <adam.emerson@earthlink.net>
Cc: 233219@bugs.debian.org, reiserfs-list@namesys.com

[ i'm CCing reiserfs' mailing list ]

hi Ciro and Adam,

this is a known bug that i'm not able to reproduce, indeed i'm able to
check a mounted read-only reiserfs filesystem.

take a look at [0], the thread on upstream's mailing list which
reports same problems. you can find also some tests which could help
understanding what is going wrong here.

please report results and keep all in CC.

many thanks
domenico

[0] http://marc.theaimsgroup.com/?l=reiserfs&m=107651905031144&w=2


On Tue, Feb 17, 2004 at 01:27:23PM +0100, Ciro Mattia Gonano wrote:
> Today I upgraded reiserfsprogs, and at the next reboot I got system
> halts at rcS/checkroot.sh with a failure of fsck.reiserfs that says he
> cannot check a filesystem mounted in read-write, while (as checkroot.sh
> does before) is mounted with
> 	mount -n -o remount,ro /
> I solved this (temporarily) setting to "no" rootcheck variable in the
> script.
> Any other has experienced this problem?
> 

-----[ Domenico Andreoli, aka cavok
 --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
