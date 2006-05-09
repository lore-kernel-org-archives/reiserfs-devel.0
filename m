From: Kristian Koehntopp <kris@koehntopp.de>
Subject: Flat files, databases and creating structure
Date: Tue, 9 May 2006 15:16:44 +0200
Message-ID: <200605091516.44501.kris@koehntopp.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28597-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


In the context of this years MySQL Users conference, Tim O'Reilly has started 
a nice article series on O'Reilly Radar under the topic of "Database War 
Stories". There is a common theme to all these postings, and it is "For some 
things, flat files rule, for others database do it better."

In 
http://radar.oreilly.com/archives/2006/05/brian_aker_of_mysql_responds.html, 
Brian Aker of MySQL summarizes this, and his closing remark is along the 
lines of

	Everyone arrives at certain truths, flat files with multiple dimensions 
	don't scale, you will need to partition your data in some manner, and 
	in the end caching is a requirement.

The "flat files with multiple dimensions" remark reminded me of some texts by 
Hans, noteably his observations in http://www.namesys.com/whitepaper.html.

Some of the articles in the series, e.g. the flickr article re the tag clouds 
problem (Why is this a problem -> 
http://www.pui.ch/phred/archives/2005/04/tags-database-schemas.html, 
http://www.pui.ch/phred/archives/2005/06/tagsystems-performance-tests.html) 
and the remarks elsewhere regarding full text indexing also strike me as 
relevant to the goals of the Reiserfs project.

I know that this is not strictly productive in the sense of code and patches, 
but maybe you have ideas or remarks that you want to share and that fit into 
the framework of this series. If so, you should probably be talking to Tim 
O'Reilly and add to this series.

Kristian

-- 
Kristian =?iso-8859-15?q?K=F6hntopp?= <kris@xn--khntopp-90a.de>
