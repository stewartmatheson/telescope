== Welcome to Telescope

Telescope is a forums application that does not have forums. Posts with in Telescope are made in the wide yonder. In the place of forums is a sophisticated search engine that remains persistent accross the wider user base.

Due to the this Telescope requires Sphinx to be installed. Here is the configure line that was used to install Sphinx during development. 

   ./configure --with-mysql-libs=/usr/local/mysql/lib
   
If your running linux then you should be able to install Sphinx via your package management system. I think there is also a version available on MacPorts but its old so I did not bother with it.

Sphinx its self requires epatXML and iconv. Both are avaiable to download from locations that will surly turn up with a google search :).  I can confirm that Sphinx 0.9.8 complies with iconv version 1.12 and epatXML 2.0.1

= Installing Sphinx on Ubuntu

If your running Ubuntu on your server then the following steps should work. First lets make sure all our software is up to date/

   sudo apt-get update
   sudo apt-get dist-upgrade
   
Next lets install the tools that will be needed to compile Sphinx.

   sudo apt-get install build-essential

Sphinx needs a database insatlled. MySQL will need the development libs so that sphinx can interact with it. These can be installed with the following.

   sudo apt-get install libmysqlclient15-dev
   
Once all this is done then you can go ahead and download Sphinx.  Download links are on their homepage. At the time of this writing stable was 0.9.9 so the following worked.

   cd /usr/local/src
   wget http://sphinxsearch.com/downloads/sphinx-0.9.9.tar.gz
   
Next untar

   tar zxvf sphinx-0.9.9.tar.gz
   cd sphinx-0.9.9.tar.gz
   
Then run configure. Remember to install to user local so that package managers don't step on your toes.

   .configure --prefix=/usr/local
   
Problems with the above step would normally indicate that your have a dependancy missing. If you dont have any problems then

   make
   sudo make install
   
You might also want to check if indexer and searchd are in your PATH at this stage but if you configured prefix to /usr/local then they should be.