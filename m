From: Francesco Biscani <biscani@pd.astro.it>
Subject: Re: possible reiser4 bug
Date: Tue, 28 Feb 2006 14:46:46 +0100
Message-ID: <200602281446.48460.biscani@pd.astro.it>
References: <2bbb1c940602232135jff393fbm2175052026237ce9@mail.gmail.com> <200602260333.28555.biscani@pd.astro.it> <200602261033.18676.zam@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28151-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200602261033.18676.zam@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Alexander Zarochentsev <zam@namesys.com>

On Sunday 26 February 2006 08:33, Alexander Zarochentsev wrote:
> please use better version of the patch (attached).

Hello,

  after some days of testing the problem seems gone. The kernel survived ma=
ny=20
CPU and I/O intensive tasks (some compilations of gcc and firefox) without =
an=20
hiccup, whereas without the patch it hanged quite soon.

Thanks and regards,

  Francesco

=2D-=20
Dr. Francesco Biscani
Dipartimento di Astronomia
Universit=E0 di Padova
biscani@pd.astro.it
