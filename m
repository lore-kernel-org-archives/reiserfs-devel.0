From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: Re: FIFO files
Date: Tue, 17 Jun 2003 18:24:19 +0200
Message-ID: <3EEF40B3.6000300@gmx.net>
References: <20030617162127.GA14124@chepelov.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14584-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030617162127.GA14124@chepelov.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Cyrille Chepelov <cyrille@chepelov.org>
Cc: reiserfs-list@namesys.com

Hi Cyrille,

Cyrille Chepelov wrote:
> 
> I recently encountered a need for such a contraption as file-backed FIFOs.
> These are files where one process can append records at one end, and one
> other process can read records from the beginning of the file, chopping off
> the head of the file once it's not needed anymore. As I had to implement
> something right now on existing systems, I worked around the general absence

This facility has been present in linux for years. Just google for "sparse
files".

Carl-Daniel
-- 
http://www.hailfinger.org/

