From: Hans Reiser <reiser@namesys.com>
Subject: Re: FIFO files
Date: Tue, 17 Jun 2003 20:32:54 +0400
Message-ID: <3EEF42B6.1000409@namesys.com>
References: <20030617162127.GA14124@chepelov.org> <3EEF40B3.6000300@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14585-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EEF40B3.6000300@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Cc: Cyrille Chepelov <cyrille@chepelov.org>, reiserfs-list@namesys.com

Carl-Daniel Hailfinger wrote:

>Hi Cyrille,
>
>Cyrille Chepelov wrote:
>  
>
>>I recently encountered a need for such a contraption as file-backed FIFOs.
>>These are files where one process can append records at one end, and one
>>other process can read records from the beginning of the file, chopping off
>>the head of the file once it's not needed anymore. As I had to implement
>>something right now on existing systems, I worked around the general absence
>>    
>>
>
>This facility has been present in linux for years. Just google for "sparse
>files".
>
>Carl-Daniel
>  
>
No, he is resetting the location of the first byte of the file.

-- 
Hans


