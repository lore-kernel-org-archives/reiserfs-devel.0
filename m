From: Andrew Morton <akpm@osdl.org>
Subject: Re: precise characterization of ext3 atomicity
Date: Thu, 4 Sep 2003 08:55:37 -0700
Message-ID: <20030904085537.78c251b3.akpm@osdl.org>
References: <3F574A49.7040900@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15551-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F574A49.7040900@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Hans Reiser <reiser@namesys.com> wrote:
>
> Is it correct to say of ext3 that it guarantees and only guarantees 
> atomicity of writes that do not cross page boundaries?

Yes.

>     By contrast, ext3 only guarantees the atomicity of a single write 
> that does not span a page boundary, and it guarantees that its internal 
> metadata will not be corrupted even if your applications data is 
> corrupted after the crash.

Not sure that I understand this.  In data=writeback mode, metadata
integrity is preserved but data writes may be lost.  In data=journal and
data=ordered modes the data and the metadata which refers to it are always
in sync on-disk.

