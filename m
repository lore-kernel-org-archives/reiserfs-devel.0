From: Daniel Phillips <phillips@arcor.de>
Subject: Re: precise characterization of ext3 atomicity
Date: Thu, 4 Sep 2003 22:16:04 +0200
Message-ID: <200309042216.04121.phillips@arcor.de>
References: <3F574A49.7040900@namesys.com> <20030904085537.78c251b3.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15562-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030904085537.78c251b3.akpm@osdl.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

On Thursday 04 September 2003 17:55, Andrew Morton wrote:
> Hans Reiser <reiser@namesys.com> wrote:
> > Is it correct to say of ext3 that it guarantees and only guarantees
> > atomicity of writes that do not cross page boundaries?
>
> Yes.

Is that just happenstance, or does Posix or similar mandate it?

Regards,

Daniel

