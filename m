From: Andrew Morton <akpm@osdl.org>
Subject: Re: precise characterization of ext3 atomicity
Date: Thu, 4 Sep 2003 09:12:56 -0700
Message-ID: <20030904091256.1dca14a5.akpm@osdl.org>
References: <3F574A49.7040900@namesys.com>
	<20030904085537.78c251b3.akpm@osdl.org>
	<3F576176.3010202@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15553-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F576176.3010202@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Hans Reiser <reiser@namesys.com> wrote:
>
>  Perhaps the following is correct?
> 
>      By contrast, ext3 in data=journal and data=ordered modes only guarantees the atomicity of a single write 
>  that does not span a page boundary, and it guarantees that its internal 
>  metadata will not be corrupted even if your application's data is 
>  corrupted after the crash (due to the application spreading what should be committed atomically across more than one block).

Correct != comprehensible ;)

"In all journalling modes ext3 guarantees metadata consistency after a
 crash.  In its data=journal and data=ordered modes ext3 also guarantees that
 user data is consistent with metadata after a crash.

 However ext3 does not provide user data atomicity guarantees beyond the
 scope of a single filesystem disk block (usually 4 kilobytes).  If a
 single write() spans two disk blocks it is possible that a crash partway
 through the write will result in only one of those blocks appearing in the
 file after recovery"

