From: "JP Howard" <jh_lists@fastmail.fm>
Subject: Re: Oops with in nfsd - 2.4.19-pre6
Date: Thu, 31 Oct 2002 21:08:28 UT
Message-ID: <20021031210828.45F4A216991@server5.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11874-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>, =?ISO-8859-1?Q?Philippe=20Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: Oleg Drokin <green@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On 31 Oct 2002 15:38:19 -0500, "Chris Mason" <mason@suse.com> said:
<...>
> The idea is that during boundless operations (creating a hole, and
> truncates), the journal code wasn't properly reserving log blocks. 
<...>

Chris, what can trigger this situation? We're currently running
data=journal on 2.4.20pre in production--are we at risk?
