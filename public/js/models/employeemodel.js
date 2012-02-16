window.Employee = Backbone.Model.extend({

    urlRoot:"/employees",

    initialize:function () {
        this.reports = new EmployeeCollection();
        this.reports.url = '/employees/' + this.id + '/reports';
    }

});

window.EmployeeCollection = Backbone.Collection.extend({

    model:Employee,

    url:"/employees",

    findByName:function (key) {
        // TODO: Modify service to include firstName in search
        var url = (key == '') ? '/employees' : "/employees/search/" + key;
        console.log('findByName: ' + key);
        var self = this;
        $.ajax({
            url:url,
            dataType:"json",
            success:function (data) {
                console.log("search success: " + data.length);
                self.reset(data);
            }
        });
    }

});
