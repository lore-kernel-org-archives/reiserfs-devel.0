From: Oleg Drokin <green@namesys.com>
Subject: Re: access beyond end of device again
Date: Mon, 24 Jun 2002 18:35:57 +0400
Message-ID: <20020624183557.A2171@namesys.com>
References: <1951319530634.20020624073524@redefine.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10814-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1951319530634.20020624073524@redefine.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin <coggy@redefine.org>
Cc: reiserfs-list@namesys.com

Hello!

   Do you get these during normal operations? 
   Then it seems some of unformatted pointers were corrupted and you need
   to run reiserfsck to clear these.

Bye,
    Oleg
On Mon, Jun 24, 2002 at 07:35:24AM -0700, Kevin wrote:
> I'm getting these errors again:
>   attempt to access beyond end of device
>   38:01: rw=0, want=2052028788, limit=58633312
> 
> anyone know what causes them? and more importantly a way to stop them
> from coming back?
> 
