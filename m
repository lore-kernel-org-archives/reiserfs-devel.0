From: Oleg Drokin <green@namesys.com>
Subject: Re: Segmentation Fault when mounting ataraid
Date: Thu, 30 Jan 2003 10:01:13 +0300
Message-ID: <20030130100113.B17582@namesys.com>
References: <3E381E3F.7080609@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12554-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E381E3F.7080609@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jochen Haemmerle <thehammer@gmx.net>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Jan 29, 2003 at 07:32:31PM +0100, Jochen Haemmerle wrote:

> So, here it comes again!
> Don't care about the warning this is the machine the errror occures!
> I hope someone understands that sh*** because I don't!!!

Ok, looks like __make_request tries to call get_request, and there is something
wrong with request queue.

> Yesterday I've patched my Kernel to 2.4.21-pre3. The "bug" does not appear!
> It seems to be only a "bug" of the 2.4.20 (on 2.4.19 it works too...as I 
> allready mentioned here)

Well, that probably means there was some bug in 2.4.20, that is now fixed in
ataraid code path in later kernel, I presume.
Though I quckly scanned changelogs and see nothing related.

Bye,
    Oleg 
