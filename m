From: Oleg Drokin <green@namesys.com>
Subject: Re: Online Resizing Failure
Date: Mon, 28 Oct 2002 21:47:50 +0300
Message-ID: <20021028214750.B1925@namesys.com>
References: <20021028192635.A1171@namesys.com> <Pine.GSO.4.33L.0210281040001.29849-100000@unix2.cc.ksu.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11815-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.33L.0210281040001.29849-100000@unix2.cc.ksu.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Stegman <matts@ksu.edu>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Oct 28, 2002 at 11:02:49AM -0600, Matt Stegman wrote:

> What fooled me was that resize_reiserfs didn't give any output at all for
> online growing, while growing offline produces some output - I guess it's
> just a summary of the fs blocks.  Why doesn't online resizing produce any
> output?

Well, actually it does return exit status ;)

Bye,
    Oleg
