From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: reiser4 panicked with zam-42245
Date: Mon, 14 Jan 2008 17:56:23 -0600
Message-ID: <1200354983.31588.13.camel@localhost>
References: <14811158.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <14811158.post@talk.nabble.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: butdiene <butdiene@yahoo.com>
Cc: reiserfs-devel@vger.kernel.org

On Mon, 2008-01-14 at 11:43 -0800, butdiene wrote:
> I got this error message reproducibly when building kernel (make).  I don't
> have the log file since kernel hangs thereafter
> 
> it happens only on my laptop but not to several other reiser4 boxes.
> 
> Thanks!

Are you sure it wasn't 32245? That's the one I get compiling. If I
disable debug, I don't see it, and reiser4 seems completely stable. With
debug enabled, I always hit zam-32245 eventually.

-- 
Jake Maciejewski <maciejej@msoe.edu>

