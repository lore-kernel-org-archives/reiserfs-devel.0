From: Michael Weissenbacher <webmaster@dermichi.com>
Subject: Re: quicker mount
Date: Thu, 27 Apr 2006 16:57:31 +0200
Message-ID: <4450DBDB.5060209@dermichi.com>
References: <20060427143635.GA5949@gelma.net> <4450D85E.50109@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28533-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4450D85E.50109@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: Jeff Mahoney <jeffm@suse.com>

Hi,
> It takes so long to mount since ReiserFS reads all the bitmaps before
> mounting. The larger the file system, the longer it takes.
I wonder why it has to read all of them. Are they stored in RAM after 
reading? Otherwise I cannot see why it should be done at all.

with kind regards,
-- 
/============================================================\
|       Michael Weissenbacher <webmaster@dermichi.com>       |
|                  http://www.dermichi.com/                  |
| "The trouble with computers is that they do what you tell  |
|           them, not what you want." -- D. Cohen            |
\============================================================/

