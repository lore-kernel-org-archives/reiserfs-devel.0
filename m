From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: reiser4 for windows
Date: Tue, 1 Feb 2005 10:52:34 +0200
Message-ID: <20050201085234.GV26192@nysv.org>
References: <20041204211059.41930.qmail@web50908.mail.yahoo.com> <41EA04B7.3050606@slaphack.com> <41EBEBF1.1050408@namesys.com> <200501171812.54199.chrivers@iversen-net.dk> <41ED3B39.2000702@namesys.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <41ED3B39.2000702@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Christian Iversen <chrivers@iversen-net.dk>, reiserfs-list@namesys.com

On Tue, Jan 18, 2005 at 08:37:13AM -0800, Hans Reiser wrote:

>>Could reiser4 support case-crushing, so it would be more "windows-native"?
>It could, as a plugin.

Reiser4 has a sys interface already, why not add echo 1 > case_crush or 
somesuch? Shouldn't take a long time to code, but it shouldn't be a
priority and no one would really want it, I guess...

-- 
mjt

