From: Josef Sipek <jsipek@fsl.cs.sunysb.edu>
Subject: Re: 2.6.18-rc3 - ReiserFS - warning: vs-8115: get_num_ver: not directory or indirect item
Date: Thu, 3 Aug 2006 15:11:00 -0400
Message-ID: <20060803191100.GF19267@filer.fsl.cs.sunysb.edu>
References: <9a8748490607300608v65ce3bdcsbb47273bb82a2d6c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29465-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <9a8748490607300608v65ce3bdcsbb47273bb82a2d6c@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesper Juhl <jesper.juhl@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Reiser <reiser@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Sun, Jul 30, 2006 at 03:08:32PM +0200, Jesper Juhl wrote:
> I just got a warning message with 2.6.18-rc3 that I've never seen before :
> 
>  ReiserFS: sda4: warning: vs-8115: get_num_ver: not directory or indirect 
>  item
 
I have seen the same message (if I remember correctly) on my laptop whenever
I tried to _compile_ the nvidia driver - it wasn't loaded yet. A switch to
XFS made it go away ;)
 
Jeff.

-- 
Bus Error: passangers dumped.
