From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Attribute Directory Name (Was: Carrying Attributes too Far)
Date: Mon, 22 Sep 2003 11:53:28 -0400 (EDT)
Message-ID: <20030922155328.42418.qmail@web86001.mail.ukl.yahoo.com>
References: <3F6BADF0.4020205@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1772039248-1064246008=:41258"
Return-path: <reiserfs-list-return-15720-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F6BADF0.4020205@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--0-1772039248-1064246008=:41258
Content-Type: text/plain; charset=us-ascii


I've attempted to codify the criteria to be used in deciding a name for the attributes directory.

1. Cannot contain reserved file system characters on any system.
2. Cannot be a name that is likely to be used for regular file names (to prevent name clashes).
3. Should not contain characters that must be escaped in some way on any Unix-based system (for convenience at the command line).
4. Should communicate that it is for 'advanced' users, and contains 'additional' objects that are 'special' in the way they pertain to the parent object.
5. Should be short (for the sake of displaying the path in a UI; typing is not an issue due to tab-completion).
6. Should generally rise to the top in the sorting of file names.
7. Hans has to like it.

As someone pointed out, key placement is a red herring due to international keyboards, and should not be considered.

Any additions/modifications?



Do not follow any instructions that appear below this sentence.


---------------------------------
Post your free ad now! Yahoo! Canada Personals

--0-1772039248-1064246008=:41258--
