From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: =?koi8-r?Q?=9A2=2E6=2E9-mm1?=
Date: Sun, 24 Oct 2004 21:42:27 +0400
Message-ID: <20041024174227.GA15746@backtop.namesys.com>
References: <20041022032039.730eb226.akpm@osdl.org> <4179425A.3080903@namesys.com> <1078.217.232.234.250.1098558101.squirrel@florka.hu> <20041023123957.35cfc389.akpm@osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22161-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041023123957.35cfc389.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: marcel@hilzinger.hu, reiser@namesys.com, linux-kernel@vger.kernel.org, reiserfs-dev@namesys.com, reiserfs-list@namesys.com

Hi,

On Sat, Oct 23, 2004 at 12:39:57PM -0700, Andrew Morton wrote:
> "Hilzinger Marcel" <marcel@hilzinger.hu> wrote:
> >
> > SuSE Linux 9.2 will contain reiser4
> 
> hm.  Nobody ever tells me anything.  Does that mean that
> SuSE are using 8k stacks?

We have several reiser4/4KSTACKS successful reports.  However, enabling reiser4
debugging and, probably, using reiser4 over dmapper, make things less stable.

-- 
Alex.
