From: Edward Shishkin <edward@namesys.com>
Subject: Re: how to use compression with reiser4
Date: Fri, 08 Jul 2005 12:41:29 +0400
Message-ID: <42CE3C39.8060907@namesys.com>
References: <20050708081050.GA6608@apartia.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25057-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050708081050.GA6608@apartia.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Louis-David Mitterrand <vindex@apartia.org>
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Louis-David Mitterrand wrote:

>Hello,
>
>I just converted a server to reiser4 for a big speed gain. Thanks, this
>looks really promising.
>
>How can I activate compression on certain parts of the filesystem? (I
>digged google for this without finding anything).
>
>  
>

Hello.
Reiser4 will support a special kind of regular files - so called 
cryptcompress
objects. Unfortunately this is not for product using for a while, but 
benchmarks
really show a speed gain for some conditions (if cpu is powerful, 
compression
algorithm is fast, and data is compressible).

Thanks,
Edward.
