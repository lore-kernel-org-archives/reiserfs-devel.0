From: David Nielsen <Lovechild@foolclan.com>
Subject: Re: New reiser4 snapshot (as of August 22, 2003)
Date: Sat, 23 Aug 2003 01:47:15 +0200
Message-ID: <1061596035.21328.10.camel@pilot.stavtrup-st.dk>
References: <20030822150853.GA960@namesys.com>
	 <1061574745.5714.1.camel@pilot.stavtrup-st.dk>
	 <16198.22925.274848.501590@laputa.namesys.com>
	 <1061575717.21328.4.camel@pilot.stavtrup-st.dk>
	 <16198.23850.137603.310946@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15392-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16198.23850.137603.310946@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

The entire thing then fails with these messages - no notable compile
errors or warnings present. 

fs/built-in.o(.text+0x9a8cd): In function `print_context':
: undefined reference to `info_atom'
fs/built-in.o(.text+0x9e392): In function `commit_current_atom':
: undefined reference to `info_atom'
fs/built-in.o(.text+0xa0577): In function `print_atom':
: undefined reference to `info_atom'
make: *** [.tmp_vmlinux1] Error 1

Seems this patch might have benefited from a compile test at least? :)

regards David


