From: David T Hollis <dhollis@davehollis.com>
Subject: Re: RPM spec file for libaal
Date: Thu, 28 Aug 2003 13:01:15 -0400
Message-ID: <3F4E355B.6060204@davehollis.com>
References: <3F4E3413.30108@davehollis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15474-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F4E3413.30108@davehollis.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs List <reiserfs-list@namesys.com>

David T Hollis wrote:

> This can be included in the libaal package to allow users to build it 
> with rpmbuild -ta libaal-XXXXX.tar.gz.  If there is desire, I could 
> produce a patch that would allow configure to embed the proper version 
> in the spec file to help automate future releases.
>
>BUILD_OPTS="--enable-stand-alone"
>%if %{enable_debug}
>BUILD_OPTS="$BUILD_OPTS	--enable-debug"
>%endif
>

Shoot, you can scratch these lines.  No longer needed.

