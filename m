From: Toby Dickenson <tdickenson@geminidataloggers.com>
Subject: integrity question
Date: Sat, 25 May 2002 20:43:29 +0100
Message-ID: <200205252043.29257.tdickenson@geminidataloggers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10417-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I am developing a storage layer for the ZODB object database, which is 
designed to play to reiserfs strengths. 

http://sourceforge.net/projects/dirstorage

I have a question about how much fsyncing is necessary to avoid losing files 
on power loss, when moving them between directories.

Consider this sequence

1. write to A/B/somefileX and fsync it
2. mkdir A/C
3. rename A/B/somefile to A/C/somefile
4. rmdir A/B
5. power loss

I would like to guarantee that, after journal replay, 'somefile' is in either 
of those two directories (or both). Am I correct to think that I dont need 
any other syncs in there?

(A second question; is there any documentation that I could have used to 
answer the first question myself?)
