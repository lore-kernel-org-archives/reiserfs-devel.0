From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: ReiserFS 2.4 patches need few fixes
Date: Mon, 24 Jan 2005 14:20:28 +0100
Message-ID: <20050124132028.6CCF13F01F@philou.gramoulle.local>
References: <200501241246.36757.bostjan.skufca@domenca.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23202-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200501241246.36757.bostjan.skufca@domenca.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hello,

Could you try these patches instead ( don't know if 2.4.25 data-logging patches apply cleanly to 2.4.29 though) ?

ftp://ftp.suse.com:/pub/people/mason/patches/data-logging/2.4.25

Thanks,

Philippe

On Mon, 24 Jan 2005 12:46:36 +0100
"Bostjan Skufca @ domenca.com" <bostjan.skufca@domenca.com> wrote:

  | there are 3 fuzz warnings and one reject when applying patches from 
  | ftp://ftp.namesys.com/pub/reiserfs-for-2.4/data-logging-2.4.24 
  | to vanilla 2.4.29 kernel.
  | 
  | 
  | Here is the patch output (irelevant output is omitted):
  | ...
