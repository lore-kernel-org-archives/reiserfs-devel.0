From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: Re: FIFO files
Date: Tue, 17 Jun 2003 19:00:25 +0200
Message-ID: <3EEF4929.20503@gmx.net>
References: <20030617162127.GA14124@chepelov.org> <3EEF40B3.6000300@gmx.net> <3EEF42B6.1000409@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14586-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EEF42B6.1000409@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Cyrille Chepelov <cyrille@chepelov.org>, reiserfs-list@namesys.com

Hans Reiser wrote:
> Carl-Daniel Hailfinger wrote:
>> Cyrille Chepelov wrote:
>> 
>>> I recently encountered a need for such a contraption as file-backed
>>>  FIFOs. These are files where one process can append records at one
>>> end, and one other process can read records from the beginning of
>>> the file, chopping off the head of the file once it's not needed
>>> anymore. As I had to implement something right now on existing
>>> systems, I worked around the general absence
>> 
>> This facility has been present in linux for years. Just google for 
>> "sparse files".
> 
> No, he is resetting the location of the first byte of the file.

Yes, but if I understood Cyrille correctly, her/his(?) needs should be
completely satisfied by sparse files.
One process can append records at the end, and one other process can read
records from the beginning of the file, marking the read data empty. The
disk usage is the same as with Cyrille's solution, but the races are avoided.
The only reason I know for wanting to chop off the head of a file is
trying to keep the file small.


Carl-Daniel

