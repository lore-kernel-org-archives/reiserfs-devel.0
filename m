From: Clemens Eisserer <linuxhippy@gmail.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Sun, 4 Sep 2005 11:29:47 +0200
Message-ID: <194f6255050904022932ca34ea@mail.gmail.com>
References: <4317FD1B.504@namesys.com>
	 <Pine.GSO.4.44L.0509021620380.23379-100000@unix2.cc.ksu.edu>
	 <b14e81f005090318046ee67d7e@mail.gmail.com>
	 <431A5E43.4060005@slaphack.com> <431A6E71.4060105@namesys.com>
Reply-To: linuxhippy@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25856-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <431A6E71.4060105@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Well, it sounds a bit like a microsoft manager explaining why XP-Home
has no terminal server features ;-)

I think an mkfs-option would be best, with a warning if the value
given by the user is nonsence (3-8% ok?).
On the contrary a 500GB hard drive with normal files on it would not
benefit too much just because 25GB are free?

lg Clemens

> This is a bit arrogant, but I believe that a user that does not know how
> to recompile the kernel with the #define changed is not sophisticated
> enough to know how much he is going to hurt his performance by going
> from 95% to 99% space used, and a user who does not want to bother with
> recompiling is not going to study the topic enough to realize he is
> making a mistake 80% of the time.  It is important to know when
> designing a product when your users intuitions are going to be wrong
> 80%of the time, and while one should always be slow to reach such a
> conclusion, I think this is such a case.
