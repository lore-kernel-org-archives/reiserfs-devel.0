From: Patrick O'Rourke <porourke@egenera.com>
Subject: Re: rsync and memory leak on linux 2.2?
Date: 14 Feb 2003 09:04:51 -0500
Message-ID: <1045231491.17182.9.camel@barnes>
References: <1045156304.11405.149.camel@barnes> 
	<87r8abtlhq.fsf@freeze.oslo.dnmi.no>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12762-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87r8abtlhq.fsf@freeze.oslo.dnmi.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Phillips <a.phillips@met.no>
Cc: reiserfs-list@namesys.com

On Fri, 2003-02-14 at 01:38, Adrian Phillips wrote:

> Well, there is a 3.5.34 which has, obviously, a number of bug
> fixes. You could try that. I've been running 2.2.20 with this version
> for a good number of months on several servers with no problems.

That's a thought.  We've been running w/ 3.5.32 (+ a variety of fixes)
for over a year and this is the only issue we have thus far and it only
occurs in an isolated scenario (i.e. rsync).

Thanks for the suggestion.

Pat

-- 
Patrick O'Rourke
porourke@egenera.com

