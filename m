From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 - small test results
Date: Tue, 19 Nov 2002 15:37:21 -0800
Message-ID: <3DDACB31.1060203@namesys.com>
References: <200211132050.gADKoQQ12656@mail.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12036-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200211132050.gADKoQQ12656@mail.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Cliff White <cliffw@osdl.org>
Cc: Nikita Danilov <Nikita@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, wookie@osdl.org

Cliff White wrote:

>Mime-Version: 1.0
>Content-Type: text/plain; charset=us-ascii
>--------
>Quick progress note, i've made some. 
>Have succeeding in building the latest snapshot against 2.5.47.
>Am doing some initial small tests (LTP disktest code) on IDE disk,
> then will move
>tests to SCSI RAID array. 
>
>First results are..interesting. Reads are fast, writes are slow.
>However, these first tests are very small and somewhat contrived,
>so i am not posting numbers yet.
>
>Results detail is at: http://www.osdl.org/archive/cliffw/reiser/index.html
>
>cliffw
>
>
>
>  
>
I have a feeling that I am going to need to return to Moscow for this to 
get sorted out.  We have an incredible slew of completely inconsistent 
benchmark results, with tremendous variance from one snapshot to 
another.  I am going to give the debuggers time to get things more 
debugged, and then I will need to personally benchmark things, analyze 
where the seeks are, etc.

Hans

