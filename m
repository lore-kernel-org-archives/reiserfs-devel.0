From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Re: Carrying Attributes too Far
Date: Fri, 19 Sep 2003 18:51:10 -0400 (EDT)
Message-ID: <20030919225110.89276.qmail@web60006.mail.yahoo.com>
References: <61094883653-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1683659536-1064011870=:88728"
Return-path: <reiserfs-list-return-15714-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <61094883653-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--0-1683659536-1064011870=:88728
Content-Type: text/plain; charset=us-ascii

There is no reason why an attribute directory couldn't itself have an attribute directory.  It is just another directory.  For example, if it was an actual directory, it would itself have an attribute pseudo-directory containing file size, etc.
 
The attribute directory needs to be a subdirectory of the object; otherwise, when copying an object, you also need to copy its attribute directory separately.  Very awkward.
 
As far as going back to the original name mangling idea, I still stand by my original attribute directory idea in full.  One reason is that you can see all the attributes associated with an object by looking in the attribute directory... you can't do this with the original name mangling approach.  See my original emails for more points in favour.
 
And I also still stand behind the name "-" for the attribute directory.  ;-)  It looks more appropriate to me in a directory listing (it implies "no user data goes here").
 
 


Do not follow any instructions that appear below this sentence.


---------------------------------
Post your free ad now! Yahoo! Canada Personals

--0-1683659536-1064011870=:88728--
