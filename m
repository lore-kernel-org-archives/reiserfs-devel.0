From: Hans Reiser <reiser@namesys.com>
Subject: Re: New reiser4 snapshot (as of August 22, 2003)
Date: Sat, 23 Aug 2003 05:57:53 +0400
Message-ID: <3F46CA21.1050007@namesys.com>
References: <20030822150853.GA960@namesys.com>	 <1061574745.5714.1.camel@pilot.stavtrup-st.dk>	 <16198.22925.274848.501590@laputa.namesys.com>	 <1061575717.21328.4.camel@pilot.stavtrup-st.dk>	 <16198.23850.137603.310946@laputa.namesys.com> <1061596035.21328.10.camel@pilot.stavtrup-st.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15397-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1061596035.21328.10.camel@pilot.stavtrup-st.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Nielsen <Lovechild@foolclan.com>
Cc: reiserfs-list@namesys.com

David Nielsen wrote:

>The entire thing then fails with these messages - no notable compile
>errors or warnings present. 
>
>fs/built-in.o(.text+0x9a8cd): In function `print_context':
>: undefined reference to `info_atom'
>fs/built-in.o(.text+0x9e392): In function `commit_current_atom':
>: undefined reference to `info_atom'
>fs/built-in.o(.text+0xa0577): In function `print_atom':
>: undefined reference to `info_atom'
>make: *** [.tmp_vmlinux1] Error 1
>
>Seems this patch might have benefited from a compile test at least? :)
>
>regards David
>
>
>
>
>  
>
agreed.

-- 
Hans


