From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: zam, please discuss this
Date: Wed, 23 Jun 2004 10:30:50 +0400
Message-ID: <20040623063049.GA5080@backtop.namesys.com>
References: <40D8EB0D.6050109@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19303-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40D8EB0D.6050109@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On Tue, Jun 22, 2004 at 07:29:33PM -0700, Hans Reiser wrote:
> 
> http://www.namesys.com/intbenchmarks/mongo/04.05.04/256MB.RAM/comparison/smart-8k.noENTD.vs.ENTD/comp-ENTD.vs.noENTD.html

Because direct page reclaiming (when a thread which needs memory does 
try_to_relase_page() by itself) is better then indirect one (through
ENTD or whatever page reclaiming daemon).  It is why Linux uses direct
page reclaiming not indirect.

-- 
Alex.

PS. Those results are old.
