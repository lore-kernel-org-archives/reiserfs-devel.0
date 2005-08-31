From: michael chang <thenewme91@gmail.com>
Subject: Executability problem
Date: Wed, 31 Aug 2005 09:40:04 -0400
Message-ID: <b14e81f005083106407ae298a1@mail.gmail.com>
References: <20050830152859.45e0b010.Kris.VanBruwaene@vrt.be>
	 <b14e81f0050830112173c03579@mail.gmail.com> <43155434.3030408@vrt.be>
	 <b14e81f0050831063950019e67@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25748-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f0050831063950019e67@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On 8/31/05, Kris Van Bruwaene <Kris.VanBruwaene@vrt.be> wrote:
> Both work for me, except on the reiserfs share...

I don't suppose your reiserfs share is mounted with noexec, is it?

Because that would explain the issue...

Check your fstab.

--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
