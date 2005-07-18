From: Leo Comerford <leocomerford@gmail.com>
Subject: Re: Installing Fedora Core with root on Reiserfs
Date: Tue, 19 Jul 2005 00:29:52 +0100
Message-ID: <ff801084050718162947bc8fa3@mail.gmail.com>
References: <42DAB928.9000303@namesys.com>
	 <200507181701.26284.russell@coker.com.au>
Reply-To: lrc1@st-and.ac.uk
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25189-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200507181701.26284.russell@coker.com.au>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: russell@coker.com.au
Cc: Edward Shishkin <edward@namesys.com>, reiserfs-list@namesys.com, fedora-test-list@redhat.com, jeffm@suse.com, reiser@namesys.com

On 7/18/05, Russell Coker <russell@coker.com.au> wrote:
> On Monday 18 July 2005 06:01, Edward Shishkin <edward@namesys.com> wrote:
> > FC4-test3 (and perhaps FC4) installs its own version of grub which seem=
s
> > to interact incorrectly with reiserfs. The problem is that reiserfs.ko
> > module located on reiserfs partition can not be loaded.

I can confirm that there is a reiserfs/GRUB problem in the final FC4
release too. (I assume it's the same problem, but I haven't
investigated it.) FWIW - evidently not much - the relevant Fedora
Bugzilla bug would appear to be 161306.
