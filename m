From: Oleg Drokin <green@namesys.com>
Subject: Re: ReiserFS is not suitable for a root FS.
Date: Sat, 17 May 2003 14:56:33 +0400
Message-ID: <20030517105633.GA20463@namesys.com>
References: <200305172030.58775.russell@coker.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14135-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200305172030.58775.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell Coker <russell@coker.com.au>
Cc: ReiserFS <reiserfs-list@namesys.com>

Hello!

On Sat, May 17, 2003 at 08:30:58PM +1000, Russell Coker wrote:

> When machines crash it seems that there is a risk of a file system corruption, 
> a crash on boot seems reasonably likely to damage the root file system.  My 
> laptop (my main test machine) has had two serious corruptions of the root 
> file system this year which caused kernel crashing on boot.

Well, if you cannot mount root fs and kernel crashes during that process, you
must boot off some other media because your fsck is still located on this root
filesytem.
This is true for any filesystem.

Bye,
    Oleg
