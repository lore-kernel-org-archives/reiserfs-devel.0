From: Oleg Drokin <green@namesys.com>
Subject: Re: How tell what version of reiserfs my filesystem is?
Date: Wed, 3 Apr 2002 15:18:13 +0400
Message-ID: <20020403151813.A4949@namesys.com>
References: <3CAAD745.447646E4@vtc.edu.hk>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3CAAD745.447646E4@vtc.edu.hk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Urbanik <nicku@vtc.edu.hk>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Apr 03, 2002 at 06:19:49PM +0800, Nick Urbanik wrote:

> How do I tell whether each of my file systems is 3.5 or 3.6?

If you run 2.2.x kernel, then you have reiserfs v3.5
If you have 2.[45].x kernel, then look it to the dmesg output
(or in the boot logs). If there is following message appears
after reiserfs mount messages: 'reiserfs: using 3.5.x disk format',
it means that filesystem is v3.5 format,
otherwise it is v3.6 format.

Also with recent 2.4 kernels (2.4.17+), you can lookup this info
in the /proc filesystem if you have enabled CONFIG_REISERFS_PROC_INFO.

Bye,
    Oleg
