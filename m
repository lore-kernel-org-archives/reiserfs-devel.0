From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Re: Carrying Attributes too Far
Date: Thu, 18 Sep 2003 18:28:59 -0400 (EDT)
Message-ID: <20030918222859.40679.qmail@web60001.mail.yahoo.com>
References: <3F6A2B00.3010003@mrs.umn.edu>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-834777811-1063924139=:40383"
Return-path: <reiserfs-list-return-15687-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F6A2B00.3010003@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--0-834777811-1063924139=:40383
Content-Type: text/plain; charset=us-ascii

[grant]
I agree they should be hidden for some users. Do you think a good solution would be to put these things in a directory named "permissions", "security-settings" or something like that, to make it 
obvious what their use is, while still allowing the curious to easily grasp why they exist? The filemanager could hide those directories if desired.
[/grant]

Hey, that sounds like a good idea -- and we could call the directory "..."  ;-)    No localization issues, and it fits in with the other special directories "." and ".." that are normally not shown.
 
[grant]
Certain files have special meaning to the kernel (like the pseudo files).
[/grant]
 
I was under the impression that whether a file was 'pseudo' or not was simply an implementation detail (like a sort of 'virtual' file).  Based on that understanding, I'm suggesting that the files in "..." are the ones that might be used by the system and/or applications ("attributes" if you will, although they are just objects like everything else), and any file can be pseudo or not, regardless of where it is.
 
[alexander]
Fair enough.  Though arguing here about naming helps with my pet project, an unrelated RAM file system for BeOS.
[/alexander]

Same here, with a linux-based application-directory-based OS project I'm part of that will likely integrate Reiser4.




Do not follow any instructions that appear below this sentence.


---------------------------------
Post your free ad now! Yahoo! Canada Personals

--0-834777811-1063924139=:40383--
