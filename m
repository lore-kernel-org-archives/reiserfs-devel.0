From: Francois-Rene Rideau <fare@tunes.org>
Subject: Re: mkreiserfs -s 1024 makes unmountable partitions
Date: Mon, 27 Jan 2003 12:26:51 +0100
Sender: Francois-Rene Rideau <fare@Samaris.tunes.org>
Message-ID: <20030127112651.GA10556@hell.mine.nu>
References: <20030118115142.B21932@namesys.com> <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115724.GA946@Kadath> <20030121213336.GA6756@hell.mine.nu> <20030122065712.D5575@humilis> <20030122100342.GA14100@hell.mine.nu> <20030124222823.GA15643@hell.mine.nu> <20030126181816.GA1274@Kadath> <20030127095957.A22720@namesys.com>
Reply-To: Francois-Rene Rideau <fare@tunes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12504-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030127095957.A22720@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Mon, Jan 27, 2003 at 09:59:57AM +0300, Oleg Drokin wrote:
> ftp://ftp.suse.com/pub/people/mason/patches/data-logging
Thanks for the tip. Can you tell me which patches are needed?

>> In any case, I think that it is a bug that mkreiserfs doesn't check
>> the consistency of its parameters with what the kernel is able to handle.
> No, that's not a bug. mkreiserfs cannot know if you are just making
> a filesystem and planning to reboot into proper kernel later
> (or even move the disk to other system).
> Also it cannot detect if your current kernel have any patches applied or =
not.
Well, it could detect that the kernel version is under some version, issue
a Warning that a patch is required wrt vanilla kernel of same version, and
give a pointer to said patch -- that would completely solve the issue with
newbies like me asking you this question.

Thanks a lot for the support!

[ Fran=E7ois-Ren=E9 =D0VB Rideau | Reflection&Cybernethics | http://fare.tu=
nes.org ]
[  TUNES project for a Free Reflective Computing System  | http://tunes.org=
  ]
A programming language is low level
when its programs require attention to the irrelevant.
	-- Alan Perlis
