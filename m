From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/3] reiserfs: make extended attributes support more
	configurable
Date: Thu, 9 Jul 2009 14:32:20 -0400
Message-ID: <20090709183220.GA6371@infradead.org>
References: <4A56313D.1020304@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A56313D.1020304@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eugene Kapun <abacabadabacaba@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jul 09, 2009 at 10:04:45PM +0400, Eugene Kapun wrote:
> From: Eugene Kapun <abacabadabacaba@gmail.com>
> 
> Adds configuration options which control how reiserfs supports extended
> attributes. This makes support for POSIX ACLs and security labels
> independent on support for normal xattrs. This also makes possible to
> compile reiserfs without any xattrs support.

There's absoutely no reason for adding even more horrible ifdef churn.

