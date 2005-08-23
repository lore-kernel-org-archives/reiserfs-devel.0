From: Clemens Eisserer <linuxhippy@gmail.com>
Subject: Re: Howto make reiser-3.6 a bit more standby friendly?
Date: Tue, 23 Aug 2005 17:51:47 +0200
Message-ID: <194f625505082308514acb124f@mail.gmail.com>
References: <194f62550508230539a1c81d9@mail.gmail.com>
	 <430B26A1.4080003@slaphack.com>
	 <194f6255050823065872f42089@mail.gmail.com>
	 <430B31E4.6080807@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25625-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <430B31E4.6080807@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi David,

> So, the simplest way is to do "-a noatime", unless you really need the
> atime updates.  It'll boost your performance, too...

Wow! To be honest I was a bit skeptic wether would work but like magic
... the drive goes into standby and wakes only up if something really
needs disk access or the kernel is swapping.
Really great - think this will really do wonders to hd lifetime :-)
Thanks!

> Nor Gentoo, but I use it there anyway.
Well I plan to switch to Gentoo soon - do you know any tutorials how
to install Gentoo on Reiser4?

Thanks for all the help, lg Clemens
