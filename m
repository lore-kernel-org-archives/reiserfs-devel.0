From: Stefan Traby <stefan@hello-penguin.com>
Subject: Re: [PATCH] reiserfs: on-demand bitmap loading (testing only)
Date: Fri, 8 Jul 2005 07:52:33 +0200
Message-ID: <20050708055233.GA14219@hello-penguin.com>
References: <42CC4B7F.2070506@suse.com> <42CC5F1E.6060505@namesys.com> <42CD528B.9040502@suse.com> <5a59ce530507071059731b30cc@mail.gmail.com> <20050708003756.21bd4c80.petchema@concept-micro.com> <42CDB7AC.8030408@slaphack.com> <42CE06A4.8070101@suse.com>
Reply-To: Stefan Traby <stefan@hello-penguin.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25053-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <42CE06A4.8070101@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeffrey Mahoney <jeffm@suse.com>
Cc: David Masover <ninja@slaphack.com>, Pierre =?iso-8859-1?Q?Etchema=EFt=E9?= <petchema@concept-micro.com>, reiserfs-list@namesys.com

On Fri, Jul 08, 2005 at 12:52:52AM -0400, Jeffrey Mahoney wrote:

> It's possible to read the bitmaps in a "delayed" fashion, but the
> problem of completely wasted resources is still not addressed. I feel
> the correct solution is to let the buffer cache do its job and not
> assume that any particular filesystem takes priority over other resources.
 
I feel 100% with you.
Getting rid of super.c:read_bitmaps is nothing but a bug-fix.

-- 

  ciao - 
    Stefan
