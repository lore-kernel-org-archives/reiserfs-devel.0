From: Oleg Drokin <green@namesys.com>
Subject: Re: Reiserfs broken in 2.5.50 (possibly nanosecond stat timefields?)
Date: Mon, 2 Dec 2002 09:16:18 +0300
Message-ID: <20021202091618.B17070@namesys.com>
References: <20021130.114825.78703224.hoho@tacomeat.net> <20021130200614.A7766@namesys.com> <200212012145.48864.tomlins@cam.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12084-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200212012145.48864.tomlins@cam.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ed Tomlinson <tomlins@cam.org>
Cc: Colin Slater <hoho@tacomeat.net>, reiserfs-list@namesys.com

Hello!

On Sun, Dec 01, 2002 at 09:45:48PM -0500, Ed Tomlinson wrote:
> > Just to make sure, does this patch helps?
> This also cleared up boot problems I was having with 2.5.50.

Welcome to the joys of unstable kernel ;)
The bug was introduced into generic kernel during some recent cleanups
and that was not reiserfs bug by itself, but it broke pretty much of stuff
everywhere.

Bye,
    Oleg
